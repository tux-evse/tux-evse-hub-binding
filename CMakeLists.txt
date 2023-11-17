###########################################################################
# Copyright 2015 - 2018 IoT.bzh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###########################################################################

CMAKE_MINIMUM_REQUIRED(VERSION 3.5)

# Project Info
# ------------------
set(NAME "tux-evse-hub-binding")

project(${NAME}
	VERSION 0.0.1
	DESCRIPTION "tux-evse-hub-binding"
	)

include(GNUInstallDirs)

set(AFM_APP_DIR ${CMAKE_INSTALL_PREFIX}/redpesk CACHE PATH "Application directory of redpesk")
option(MAKEALL "Make and install all" YES)

if(NOT MAKEALL)
	set(exclude EXCLUDE_FROM_ALL)
endif(NOT MAKEALL)

# Install as redpesk component
configure_file(
    ${CMAKE_SOURCE_DIR}/manifest.yml.in
    ${CMAKE_CURRENT_BINARY_DIR}/manifest.yml
    @ONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/manifest.yml DESTINATION ${DESTDIR}${AFM_APP_DIR}/${NAME}/.rpconfig
    COMPONENT ${NAME} ${exclude})

install(FILES ${CMAKE_SOURCE_DIR}/src/start_hub_bender.sh DESTINATION ${DESTDIR}${AFM_APP_DIR}/${NAME}/bin
    COMPONENT ${NAME} ${exclude})

if(NOT MAKEALL)
	message("")
	message(" for installing plugin X type: make X && cmake -DCOMPONENT=X -P cmake_install.cmake")
	message("")
endif(NOT MAKEALL)

