pragma Singleton

import "root:/config"
import "root:/utils"
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property list<string> colourNames: ["rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender"]

    property bool showPreview
    property bool endPreviewOnNextChange
    property bool light
    readonly property Colours palette: showPreview ? preview : current
    readonly property Colours current: Colours {}
    readonly property Colours preview: Colours {}
    readonly property Transparency transparency: Transparency {}

    function alpha(c: color, layer: bool): color {
        if (!transparency.enabled)
            return c;
        c = Qt.rgba(c.r, c.g, c.b, layer ? transparency.layers : transparency.base);
        if (layer)
            c.hsvValue = Math.max(0, Math.min(1, c.hslLightness + (light ? -0.2 : 0.2))); // TODO: edit based on colours (hue or smth)
        return c;
    }

    function on(c: color): color {
        if (c.hslLightness < 0.5)
            return Qt.hsla(c.hslHue, c.hslSaturation, 0.9, 1);
        return Qt.hsla(c.hslHue, c.hslSaturation, 0.1, 1);
    }

    function load(data: string, isPreview: bool): void {
        const colours = isPreview ? preview : current;
        for (const line of data.trim().split("\n")) {
            let [name, colour] = line.split(" ");
            name = name.trim();
            name = colourNames.includes(name) ? name : `m3${name}`;
            if (colours.hasOwnProperty(name))
                colours[name] = `#${colour.trim()}`;
        }

        if (isPreview && endPreviewOnNextChange) {
            showPreview = false;
            endPreviewOnNextChange = false;
        }
    }

    function setMode(mode: string): void {
        setModeProc.command = ["caelestia", "scheme", "dynamic", "default", mode];
        setModeProc.startDetached();
    }

    Process {
        id: setModeProc
    }

    FileView {
        path: `${Paths.state}/scheme/current-mode.txt`
        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.light = text() === "light"
    }

    FileView {
        path: `${Paths.state}/scheme/current.txt`
        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.load(text(), false)
    }

    component Transparency: QtObject {
        readonly property bool enabled: false
        readonly property real base: 0.78
        readonly property real layers: 0.58
    }

    component Colours: QtObject {

property color m3primary_paletteKeyColor: "#f72d7c"
property color m3secondary_paletteKeyColor: "#bd93f9"
property color m3tertiary_paletteKeyColor: "#ff79c6"
property color m3neutral_paletteKeyColor: "#6E6C7E"
property color m3neutral_variant_paletteKeyColor: "#7A748E"

property color m3background: "#181825"
property color m3onBackground: "#e3c7fc"

property color m3surface: "#181825"
property color m3surfaceDim: "#161622"
property color m3surfaceBright: "#2c2a3a"
property color m3surfaceContainerLowest: "#0f0f15"
property color m3surfaceContainerLow: "#15141e"
property color m3surfaceContainer: "#1e1e2e"
property color m3surfaceContainerHigh: "#232334"
property color m3surfaceContainerHighest: "#29293e"

property color m3onSurface: "#e3c7fc"
property color m3surfaceVariant: "#6A5D77"
property color m3onSurfaceVariant: "#CBB2E1"

property color m3inverseSurface: "#e3c7fc"
property color m3inverseOnSurface: "#2c273a"

property color m3outline: "#9A88AC"
property color m3outlineVariant: "#6A5D77"
property color m3shadow: "#000000"
property color m3scrim: "#000000"

property color m3surfaceTint: "#f72d7c"

property color m3primary: "#f72d7c"
property color m3onPrimary: "#2e0c22"
property color m3primaryContainer: "#a61d60"
property color m3onPrimaryContainer: "#fce3f0"
property color m3inversePrimary: "#bd4e8a"

property color m3secondary: "#bd93f9"
property color m3onSecondary: "#291f4a"
property color m3secondaryContainer: "#5a4c84"
property color m3onSecondaryContainer: "#e7ddff"

property color m3tertiary: "#ff79c6"
property color m3onTertiary: "#401c34"
property color m3tertiaryContainer: "#cc5fa0"
property color m3onTertiaryContainer: "#fff0f8"

property color m3error: "#B52A5B"
property color m3onError: "#33010d"
property color m3errorContainer: "#721f3e"
property color m3onErrorContainer: "#ffdbe3"

property color m3primaryFixed: "#fce3f0"
property color m3primaryFixedDim: "#f72d7c"
property color m3onPrimaryFixed: "#2e0c22"
property color m3onPrimaryFixedVariant: "#a61d60"

property color m3secondaryFixed: "#e7ddff"
property color m3secondaryFixedDim: "#bd93f9"
property color m3onSecondaryFixed: "#291f4a"
property color m3onSecondaryFixedVariant: "#5a4c84"

property color m3tertiaryFixed: "#fff0f8"
property color m3tertiaryFixedDim: "#ff79c6"
property color m3onTertiaryFixed: "#401c34"
property color m3onTertiaryFixedVariant: "#cc5fa0"


        property color rosewater: "#B8C4FF"
        property color flamingo: "#DBB9F8"
        property color pink: "#F3B3E3"
        property color mauve: "#D0BDFE"
        property color red: "#F8B3D1"
        property color maroon: "#F6B2DA"
        property color peach: "#E4B7F4"
        property color yellow: "#C3C0FF"
        property color green: "#ADC6FF"
        property color teal: "#D4BBFC"
        property color sky: "#CBBEFF"
        property color sapphire: "#BDC2FF"
        property color blue: "#C7BFFF"
        property color lavender: "#EAB5ED"
    }
}
