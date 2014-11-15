#!/usr/bin/env ruby
#encoding:utf-8

class JuiceDB < ActiveRecord::Base
  self.abstract_class = true
  if Rails.env == "production"
    establish_connection :juicedb
  else
    establish_connection Rails.env
  end
end
