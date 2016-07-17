#!/usr/bin/env ruby

require 'rest-client'
require 'json'
require "base64"

scheme   = "https://"
base_url = "crm.octopussystems.cz/api/v1/"
user     = ""
password = ""
login    = "#{user}:#{password}"
uri      = "#{scheme}#{login}@#{base_url}"
uri_nl   = "#{scheme}#{base_url}"

puts uri

#lead    = "lead"
account = "Account"

#clients = RestClient.get "#{uri}#{account}", {:accept => :json}
clients = RestClient.get "#{uri}#{account}"

clients_json = JSON.parse(clients)
client_id = clients_json["list"][0]["id"]

puts client_id

name_json = { 'name' => 'Easy Software s.r.o', 'assignedUserId' => '1' }.to_json
#puts name_json
puts "#{uri}#{account}/#{client_id}"
update_client = RestClient.put "#{uri}#{account}/#{client_id}", name_json, {"content-type" => "application/json"}

puts update_client.code
