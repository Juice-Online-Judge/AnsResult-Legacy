#!/usr/bin/env ruby
#encoding:utf-8

class AdminUser < Upmin::Model
  attributes :username, :name, :email, :password, :role
  actions :update_role, :update_password
  def update_password(raw_password)
    model.password = raw_password
    model.save!
  end
  def update_role(raw_role)
    model.role = raw_role.to_i
    model.save!
  end
end
