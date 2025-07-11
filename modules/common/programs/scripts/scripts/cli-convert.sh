#!/usr/bin/env bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is required but not installed."
    echo "Install with:"
    echo "  Ubuntu/Debian: sudo apt install ffmpeg"
    echo "  macOS: brew install ffmpeg"
    exit 1
fi

# Simple menu interface
show_menu() {
    clear
    echo "╔══════════════════════════════╗"
    echo "║    VIDEO TO GIF CONVERTER    ║"
    echo "╠══════════════════════════════╣"
    echo "║ 1) Select video file         ║"
    echo "║ 2) Set output name           ║"
    echo "║ 3) Set conversion settings   ║"
    echo "║ 4) Start conversion          ║"
    echo "║ 5) Quit                      ║"
    echo "╚══════════════════════════════╝"
    
    if [ -n "$input_file" ]; then
        echo -e "\nSelected file: $input_file"
    fi
    if [ -n "$output_file" ]; then
        echo "Output file: $output_file"
    fi
    if [ -n "$fps" ]; then
        echo "Settings: ${fps}fps, ${width}px wide, start at ${start_time}s, duration ${duration}s"
    fi
}

# Main loop
while true; do
    show_menu
    read -p "Select option (1-5): " choice
    
    case $choice in
        1)
            read -p "Enter video file path: " input_file
            if [ ! -f "$input_file" ]; then
                echo "File not found!"
                read -p "Press Enter to continue..."
                input_file=""
            else
                default_output="${input_file%.*}.gif"
                output_file="$default_output"
            fi
            ;;
        2)
            if [ -z "$input_file" ]; then
                echo "Please select a video file first!"
                read -p "Press Enter to continue..."
                continue
            fi
            read -p "Enter output GIF filename [$default_output]: " output_file
            output_file=${output_file:-$default_output}
            ;;
        3)
            read -p "Frames per second (10-30) [15]: " fps
            fps=${fps:-15}
            read -p "Width in pixels (300-1200) [640]: " width
            width=${width:-640}
            read -p "Start time in seconds [0]: " start_time
            start_time=${start_time:-0}
            read -p "Duration in seconds [5]: " duration
            duration=${duration:-5}
            ;;
        4)
            if [ -z "$input_file" ] || [ -z "$output_file" ] || [ -z "$fps" ]; then
                echo "Please complete all steps first!"
                read -p "Press Enter to continue..."
                continue
            fi
            
            echo -e "\nConverting $input_file to $output_file..."
            echo "Settings: ${fps}fps, ${width}px wide, start at ${start_time}s, duration ${duration}s"
            
            ffmpeg -y -ss "$start_time" -t "$duration" -i "$input_file" \
                -vf "fps=$fps,scale=$width:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
                -loop 0 "$output_file" 2> /dev/null
            
            if [ $? -eq 0 ]; then
                echo -e "\nConversion successful! Created $output_file"
                echo "File size: $(du -h "$output_file" | cut -f1)"
            else
                echo -e "\nConversion failed!"
            fi
            read -p "Press Enter to continue..."
            ;;
        5)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option!"
            read -p "Press Enter to continue..."
            ;;
    esac
done
