local rocks = require("luarocks.loader")
local crypto = require("crypto")
local hmac = require("crypto.hmac")
local base64 = require("base64")


ngx.req.read_body()
local body = ngx.req.get_body_data()
if body then
	local key = base64.decode("oUrokBp4TkOwOSJybJGwJro6xSaeYB1Kn8o4YCqzCpk=")
	local authorization = ngx.var.http_authorization or ''
	ngx.log(ngx.INFO, "Authorization: " .. authorization)
	local supplied_hash = string.gsub(authorization, '^SharedKey ', '')
	local src = ngx.var.request_uri .. '\n' .. body
	local computed_hash = base64.encode(hmac.digest('sha256', src, key, true))
	ngx.log(ngx.INFO, "Computed: " .. computed_hash)

	if supplied_hash ~= computed_hash then
		ngx.exit(ngx.HTTP_FORBIDDEN)
	end
end