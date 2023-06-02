#!/bin/bash
echo -e "\n\n\n\nBatento no servidor 2 192.168.0.62"
echo "===================================================================="
tmp_cookie=$(curl -v -s http://192.168.0.62/session.php 2>&1 | grep 'Set-Cookie:' | tr -s '[:space:]' ' ' | cut -d" " -f3 | sed 's/.$//')
curl --cookie "$tmp_cookie" http://192.168.0.61/session.php http://192.168.0.62/session.php http://192.168.0.63/session.php
curl --cookie "$tmp_cookie" http://192.168.0.61/session.php http://192.168.0.62/session.php http://192.168.0.63/session.php
curl --cookie "$tmp_cookie" http://192.168.0.61/session.php http://192.168.0.62/session.php http://192.168.0.63/session.php
curl --cookie "$tmp_cookie" http://192.168.0.61/session.php http://192.168.0.62/session.php http://192.168.0.63/session.php
curl --cookie "$tmp_cookie" http://192.168.0.61/session.php http://192.168.0.62/session.php http://192.168.0.63/session.php
curl --cookie "$tmp_cookie" http://192.168.0.61/session.php http://192.168.0.62/session.php http://192.168.0.63/session.php
