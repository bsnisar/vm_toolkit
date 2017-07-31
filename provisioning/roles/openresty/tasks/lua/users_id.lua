local ip = ngx.var.remote_addr
local user_agent = ngx.var.http_user_agent or ''

local user_uid = ngx.encode_base64(
    ngx.sha1_bin(ip .. user_agent)
)

ngx.var.user_uid = user_uid



