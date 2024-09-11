#!/bin/bash

# Ensure the directory exists for storing the trigger file
trigger_dir="/home/whonow/FORMYCODE/clipboard2script"
mkdir -p "$trigger_dir"

# Path to store the generated script path
trigger_file="$trigger_dir/works.txt"

# Function to capture script from clipboard
capture_clipboard() {
    script_content=$(xclip -o)  # Capture clipboard content using xclip
    if [[ -z "$script_content" ]]; then
        echo "Clipboard is empty. Please copy your script to the clipboard and try again."
        exit 1
    fi
}

# Capture the clipboard content
capture_clipboard

# Detect the script type based on the first line
first_line=$(echo "$script_content" | head -n 1)
if [[ $first_line == "#!/bin/bash"* ]]; then
    extension=".sh"
else
    extension=".py"
fi

# Generate unique filename if it exists
filename="test_scriptgenx$extension"
if [[ -f "$filename" ]]; then
    count=2
    while [[ -f "test${count}_scriptgenx$extension" ]]; do
        count=$((count + 1))
    done
    filename="test${count}_scriptgenx$extension"
fi

# Write the script content to the file
echo "$script_content" > "$filename"

# Store the full path of the generated script in the new trigger file
full_path=$(pwd)/"$filename"
echo "$full_path" > "$trigger_file"

# Make the generated script executable
chmod +x "$filename"

# Run the generated script automatically
if [[ "$extension" == ".py" ]]; then
    python3 "$filename"
else
    ./"$filename"
fi

# Confirm completion
echo "The script $filename has been created, made executable, and run."
echo "Script path stored in $trigger_file"
