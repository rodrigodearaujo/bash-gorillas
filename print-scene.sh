#!/bin/bash

# bash-gorillas is a demake of QBasic GORILLAS completely rewritten
# in Bash.
# Copyright (C) 2013 Istvan Szantai <szantaii at sidenote dot hu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program (LICENSE).
# If not, see <http://www.gnu.org/licenses/>.

# Prints the contents of 'grid' into the screen buffer,
# then refreshes the screen
print_scene()
{
	# Clear screen
	clear >> ${buffer}
	
	# Print the contents of $grid to the buffer
	for((i=0; i < grid_width; i++))
	do
		for ((j=0; j < grid_height; j++))
		do
			tput cup $(($(($((top_padding_height + grid_height)) - j)) - 1)) \
				$((left_padding_width + i)) >> ${buffer}
			
			printf "${grid["${i},${j}"]}" >> ${buffer}
		done
	done
	
	# Refresh screen
	refresh_screen
}

