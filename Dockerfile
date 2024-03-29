##
# Copyright IBM Corporation 2016, 2017, 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Builds a Docker image with all the dependencies for compiling and running the NN2048 sample application.

FROM ibmcom/swift-ubuntu:5.0
MAINTAINER Tanmay Bakshi
LABEL Description="Docker image for building and running the Tanmay2048 Application."

# Expose default port for Kitura
EXPOSE 8080

RUN mkdir /NN2048

ADD Sources /NN2048/Sources
ADD Tests /NN2048/Tests
ADD public /NN2048/public
ADD Package.swift /NN2048
ADD Package.resolved /NN2048
ADD LICENSE /NN2048
ADD .swift-version /NN2048
RUN cd /NN2048 && swift build

CMD [ "sh", "-c", "cd /NN2048 && .build/x86_64-unknown-linux/debug/NN2048" ]
