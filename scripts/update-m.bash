#!/usr/bin/env bash

auth_header=()
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	auth_header=(-H "Authorization: Bearer $GITHUB_API_TOKEN")
fi

latestVersion=$(curl -sL \
	-H "Accept: application/vnd.github+json" \
	"${auth_header[@]}" \
	https://api.github.com/repos/aheckmann/m/commits/master |
	grep '"sha"' | head -n1 | sed -E 's/.*"sha": "([0-9a-f]+)".*/\1/')

if [ -z "$latestVersion" ]; then
	echo "Failed to fetch latest commit SHA (rate limited? Set GITHUB_API_TOKEN to authenticate)"
	exit 1
fi

echo "Updating lib/m to $latestVersion..."

curl -sL "https://raw.githubusercontent.com/aheckmann/m/$latestVersion/bin/m" | awk -v version="$latestVersion" '
BEGIN {
    print "#!/usr/bin/env bash"
    print "# shellcheck disable=all"
    printf "# Copied from hash %s of https://github.com/aheckmann/m\n", version
    getline
}
{
    print
}' >lib/m
chmod +x lib/m

echo "Done. lib/m updated to $latestVersion"
