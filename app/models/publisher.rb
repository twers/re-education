# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: publishers
#
#  id                :integer          not null, primary key
#  avatar            :string(255)
#  email             :string(255)
#  alternative_name  :string(255)
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  password          :string(255)
#

class Publisher < ActiveRecord::Base
  apply_simple_captcha :message => "验证码有误"

  validates :email,
    :uniqueness => {
      :message => "此邮箱地址已经被使用"
      },
    :presence => {
      :message => "邮箱地址为必填写项"
    }

  validates :alternative_name,
    :uniqueness => {
      :message => "此用户名已经被使用"
    },
    :presence => {
      :message => "用户名为必填写项"
    },
    :length => {
      :maximum => 50,
      :message => "用户名长度不能超过50字" }

  validates :password,
    :presence => {
      :message => "密码为必填写项"
    },
    :confirmation => {
      :message => "两次密码输入不一致"
    }

  has_many :lessonplans

  mount_uploader :avatar, AvatarUploader

  def self.authenticate(email, password)
    instance = Publisher.find_by_email(email)
    return false unless instance
    instance.authenticate(password)
  end

  def authenticate(password)
    if self.password_digest == encrypt_password(password)
      self
    else
      false
    end
  end

  def attachment_filename
    read_attribute(:avatar)
  end

  def avatar_link
    self.avatar_url || '/assets/avatar.png'
  end

  alias_attribute :name, :alternative_name

  def super_manager?
    self.alternative_name.eql? 'openclass'
  end

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(pass)
    @password = pass
    self.password_digest = encrypt_password(pass) unless pass.blank?
  end

  private

  def encrypt_password(pass)
    Digest::MD5.hexdigest(pass)
  end
end
