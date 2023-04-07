# Copyright © 2023 Marlon Beijer <marlon@amigadev.com>
# https://github.com/mbeijer
#
# This Source Code Form is subject to the terms of the
# Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed
# with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

function(add_project_info SHORT AUTHOR TYPE ARCH)
	set(AMINET_SHORT "${SHORT}" PARENT_SCOPE)
	set(AMINET_AUTHOR "${AUTHOR}" PARENT_SCOPE)
	set(AMINET_TYPE "${TYPE}" PARENT_SCOPE)
	set(AMINET_ARCH "${ARCH}" PARENT_SCOPE)
endfunction(add_project_info)