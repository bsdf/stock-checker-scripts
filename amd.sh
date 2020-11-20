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

CHECK_URL="https://www.amd.com/en/direct-buy/5450881600/us"
BUY_URL="https://www.amd.com/en/direct-buy/5450881600/us?add-to-cart=true"
PATTERN="product-out-of-stock"

run
