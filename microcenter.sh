#!/bin/sh

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

. ./functions.sh

CHECK_URL="https://www.microcenter.com/product/630284/amd-ryzen-7-5800x-vermeer-38ghz-8-core-am4-boxed-processor?storeid=151"
PATTERN="inventoryCnt.*Sold Out"

check_connectivity() {
    ping -q -c 1 -W 1 8.8.8.8 > /dev/null && curl -s -A "$USER_AGENT" "https://www.microcenter.com" > /dev/null
}

run
