#!/usr/bin/python

import sys
import os
import json
from subprocess import run as shellRun
import gi
import mimetypes

gi.require_version('Gtk', '3.0')
from gi.repository import Gio, Gtk

REPLACE = {}
eww_dir = os.path.expanduser("~/.config/hypr/eww")
jsonPath = "/tmp/eww/apps.json"
countPath = os.path.expanduser("~/.cache/eww/appcount.json")

os.makedirs(os.path.dirname(jsonPath), exist_ok=True)
os.makedirs(os.path.dirname(countPath), exist_ok=True)

def fetch(icon_name):
    if not icon_name:
        return
    icon_theme = Gtk.IconTheme.get_default()
    icon = icon_theme.lookup_icon(icon_name, 48, 0)
    return icon.get_filename() if icon else None

def cache_count():
    if os.path.exists(countPath):
        with open(countPath, "r") as f:
            try:
                return json.load(f)
            except json.JSONDecodeError:
                pass
    return {}

def update_cache_count(count):
    with open(countPath, "w") as f:
        json.dump(count, f, indent=2)

def increment_app(app_name):
    counts = cache_count()
    counts[app_name] = counts.get(app_name, 0) + 1
    update_cache_count(counts)

def get_desktop_entries(app_info, app_count):
    app_name = app_info.get_name()
    icon = app_info.get_icon()
    icon_name = icon.to_string() if icon else None
    icon_path = fetch(icon_name) or fetch("unknown")
    exe_path = app_info.get_executable()
    count = app_count.get(app_name.lower(), 0)
    return {
        "name": app_name.title(),
        "icon": icon_path,
        "comment": app_info.get_description() or "",
        "desktop": REPLACE.get(exe_path, exe_path),
        "count": count
    }

def update_cache(all_apps):
    with open(jsonPath, "w") as f:
        json.dump({"apps": all_apps}, f, indent=2)

def get_cached_entries(refresh=False):
    if os.path.exists(jsonPath) and not refresh:
        with open(jsonPath, "r") as f:
            try:
                return json.load(f)
            except json.JSONDecodeError:
                pass

    all_apps = []
    app_count = cache_count()

    for app_info in Gio.AppInfo.get_all():
        if app_info.should_show():
            all_apps.append(get_desktop_entries(app_info, app_count))

    all_apps.sort(key=lambda x: -x["count"])
    update_cache(all_apps)
    return {"apps": all_apps}

def get_file_matches(query, max_files=150):
    matches = []
    for root, dirs, files in os.walk(os.path.expanduser("~")):
        for name in files:
            if query.lower() in name.lower():
                path = os.path.join(root, name)
                matches.append({
                    "name": name,
                    "icon": fetch("text-x-generic"),
                    "comment": path,
                    "desktop": f"__file__::{path}",
                    "count": 0
                })
                if len(matches) >= max_files:
                    return matches
    return matches

def filter_entries(entries, query):
    query = query.strip()
    if query.startswith("f|"):
        term = query[2:].strip()
        files = get_file_matches(term)
        update_eww_height(220 if files else 120)
        return files

    elif query.startswith("u2|"):
        term = query[3:].strip()
        update_eww_height(120)
        return [{
            "name": f"U2 Search for {term}",
			"icon": os.path.expanduser("~/.config/hypr/eww/images/youtube.svg"),
            "comment": f"Search YouTube for '{term}'",
            "desktop": f"__youtube__::{term} ",
            "count": 0
        }]

    elif query.startswith("|"):
        term = query[1:].strip() 
        update_eww_height(120)
        return [{
            "name": f"Web Search for {term}",
            "icon": fetch("web-browser") or "",
            "comment": f"Search Google for '{term}'",
            "desktop": f"__search__::{term}",
            "count": 0
        }]

    else:
        filtered = []
        q = query.lower()
        for app in entries["apps"]:
            name = app["name"].lower()
            comment = app["comment"].lower()
            if any(word in name or word in comment for word in q.split()):
                filtered.append(app)
        update_eww_height(220 if filtered else 120)
        return filtered

def filter_top(apps, n):
    return apps[:n]

def update_eww(data):
    shellRun(["eww", "-c", eww_dir, "update", f"appsjson={json.dumps(data)}"])

def update_eww_height(height):
    shellRun(["eww", "-c", eww_dir, "update", f"winheight={height}px"])

def open_file(path):
    ext = os.path.splitext(path)[1].lower()
    mime_type, _ = mimetypes.guess_type(path)
    
    if ext in [".py", ".sh", ".txt", ".md", ".bash", ".conf", ".yuck", ".scss", ".css"]:
        shellRun(["geany", path])
    elif mime_type and mime_type.startswith("image"):
        shellRun(["imv", path])
    elif mime_type and mime_type.startswith("video"):
        shellRun(["mpv", path])
    elif mime_type and mime_type.startswith("audio"):
        shellRun(["mpv", path])
    else:
        shellRun(["xdg-open", path])

if __name__ == "__main__":
    args = sys.argv

    if len(args) > 2 and args[1] == "--query":
        query = " ".join(args[2:])
        entries = get_cached_entries()
        filtered = filter_entries(entries, query)
        filtered = filter_top(filtered, 30)
        update_eww({"apps": filtered})

    elif len(args) > 2 and args[1] == "--increase":
        app_name = " ".join(args[2:])
        if app_name.startswith("__search__::"):
            query = app_name.split("::", 1)[1]
            shellRun(["librewolf", "--new-window", f"https://www.google.com/search?q={query}"])
        elif app_name.startswith("__youtube__::"):
            query = app_name.split("::", 1)[1]
            shellRun(["librewolf", "--new-window", f"https://www.youtube.com/results?search_query={query}"])
        elif app_name.startswith("__file__::"):
            path = app_name.split("::", 1)[1]
            open_file(path)
        else:
            increment_app(app_name.lower())

    else:
        entries = get_cached_entries(True)
        entries["apps"] = filter_top(entries["apps"], 50)
        update_eww(entries)
