#!/bin/sh

echo "# ♻️  Obtain a telegram servers secret and telegram configuration."
echo "curl -s https://core.telegram.org/getProxySecret -o proxy-secret \\"
echo "  && curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf"
echo
echo "# 🔒 Generate a users secret"
echo "head -c 16 /dev/urandom | xxd -ps"
echo
echo "# 🚀 Run as"
echo "mtproto-proxy -u nobody -p 8888 -H 443 -S <secret> --aes-pwd proxy-secret proxy-multi.conf -M 1"
