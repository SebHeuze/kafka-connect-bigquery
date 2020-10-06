#! /usr/bin/env bash
#
# Copyright 2020 Confluent, Inc.
#
# This software contains code derived from the WePay BigQuery Kafka Connector, Copyright WePay, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

for schema_dir in /tmp/schemas/*; do
  kafka-avro-console-producer \
      --topic "kcbq_test_`basename $schema_dir`" \
      --broker-list 'kafka:29092' \
      --property value.schema="`cat \"$schema_dir/schema.json\"`" \
      --property schema.registry.url='http://schema-registry:8081' \
      < "$schema_dir/data.json"
done
