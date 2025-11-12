import asyncdispatch, httpclient, json, strutils
const api = "https://www.whatismyip.net"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "www.whatismyip.net",
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
})

proc my_ip*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/geoip")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc ip_info*(ip:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/geoip/?ip=" & ip)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_whois*(host:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/whois/?domain=" & host)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
