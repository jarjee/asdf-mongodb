#!/usr/bin/env bash

if [ -z "$GITHUB_API_TOKEN" ]; then
	echo "This script requires environment variable GITHUB_API_TOKEN"
	exit 1
fi

latestVersion=$(curl -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $GITHUB_API_TOKEN" -L https://api.github.com/repos/aheckmann/m/commits/master | grep sha | head -n1 | sed -E 's/.*"sha": "([0-9a-f]+)".*/\1/')

curl https://raw.githubusercontent.com/aheckmann/m/master/bin/m | awk -v version="$latestVersion" '
BEGIN {
    print "#!/usr/bin/env bash"
    print "# shellcheck disable=all"
    printf "# Copied from hash %s of https://github.com/aheckmann/m\n", version
    # Skip the first line of the original input
    getline
}
{
    # Print the rest of the lines as they are
    print
}' >lib/m
chmod +x lib/m
