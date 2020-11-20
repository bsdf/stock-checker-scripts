# This file is part of stock-checker-scripts.

# stock-checker-scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# stock-checker-scripts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with stock-checker-scripts.  If not, see <https://www.gnu.org/licenses/>.

USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.0"

SECONDS_MIN=240
SECONDS_MAX=600

check_connectivity() {
    ping -q -c 1 -W 1 8.8.8.8 > /dev/null
}

wait_for_internet() {
    while true; do
        check_connectivity && break
        sleep 5s
    done
}

echo_time() {
    date +"%Y-%m-%dT%H:%M:%S - $*"
}

run() {
    while true; do
        if check_connectivity; then
            if curl -s -A "$USER_AGENT" "$CHECK_URL" | grep -o "$PATTERN"; then
                echo_time "PRODUCT OUT OF STOCK"
            else
                echo_time "PRODUCT MAYBE NOT OUT OF STOCK"

                PUSH_URL="${BUY_URL:-$CHECK_URL}"
                xdg-open "$PUSH_URL"
                # install pushbullet-cli and uncomment to push notification through pushbullet
                # https://github.com/GustavoKatel/pushbullet-cli
                # pb push --link "$PUSH_URL"
            fi

            SLEEP_TIME=$(shuf -i $SECONDS_MIN-$SECONDS_MAX -n 1)
            echo_time "SLEEPING FOR ${SLEEP_TIME} SECONDS..."
            sleep "${SLEEP_TIME}s"
        else
            echo_time "NO INTERNET CONNECTION..."
            wait_for_internet
        fi
    done
}
