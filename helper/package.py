import json
import sys

target_file = sys.argv[1]
pretty_script = "prettier --require-pragma --config .prettierrc --write \"src/**/*.js\""

###############################################################################

with open(target_file) as json_file:
    json_decoded = json.load(json_file)

# Enable linking custom font files for the RN project
json_decoded["rnpm"] = {
    "assets": [
        "./assets/fonts/"
    ]
}

# Add script to automate `pretty`-fying every JS file in `src/`
if "scripts" not in json_decoded:
    json_decoded["scripts"] = {"pretty": pretty_script}
else:
    json_decoded["scripts"]["pretty"] = pretty_script

# Dump json data to target file
with open(target_file, 'w') as json_file:
    json.dump(json_decoded, json_file, indent=2)
