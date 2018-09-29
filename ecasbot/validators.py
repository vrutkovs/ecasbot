#!/usr/bin/python3
# coding=utf-8

# EC AntiSpam bot for Telegram Messenger
# Copyright (c) 2017 - 2018 EasyCoding Team
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import re


class Validators:
    def __nickname_chinese_bots(self, username):
        # Find chinese bots and score them to +100...
        return 100 if re.search(self.__settings.chkrgx, username, re.I | re.M | re.U) else 0

    def __nickname_with_url(self, username):
        # Score users with URLs in username...
        return 100 if re.search(self.__settings.urlrgx, username, re.I | re.M | re.U) else 0

    def __nickname_restricted_words(self, username):
        # Score users with restricted words in username...
        return 100 if any(w in username for w in self.__settings.stopwords) else 0

    def __nickname_too_long(self, username):
        # Score users with very long usernames...
        return 50 if len(username) > self.__settings.maxname else 0

    def __nickname_hieroglyphs(self, username):
        # Score users with chinese hieroglyphs...
        return 50 if re.search('[\u4e00-\u9fff]+', username, re.I | re.M | re.U) else 0

    def __init__(self, settings):
        self.__settings = settings