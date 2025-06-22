#!/usr/bin/env ruby
require 'time'
require 'fileutils'

# === 配置项（可按需修改） ===
POSTS_DIR = "_posts"                # 存放文章的目录
TIMEZONE  = "+0800"                 # 默认时区
EXT       = "md"                    # 文件扩展名

# === 获取用户输入的标题 ===
print "请输入文章标题："
title = STDIN.gets.chomp.strip

# === 转为文件名用的 slug ===
slug = title.downcase.strip.gsub(/[^\w\s-]/, '').gsub(/\s+/, '-')

# === 当前时间 ===
now = Time.now
date_prefix = now.strftime("%Y-%m-%d")
datetime    = now.strftime("%Y-%m-%d %H:%M:%S #{TIMEZONE}")
filename    = "#{POSTS_DIR}/#{date_prefix}-#{slug}.#{EXT}"

# === Front Matter 模板 ===
front_matter = <<~FRONT
  ---
  layout: post
  title: "#{title}"
  date: #{datetime}
  categories: []
  tags: []
  author: halfopenai
  image: /assets/img/20250622.jpeg
  math: false
  toc: true
  published: true
  related: false
  pin: false
  #last_modified_at: "#{datetime}"
  ---
FRONT

# === 创建目录并写入文件 ===
FileUtils.mkdir_p(POSTS_DIR)
File.write(filename, front_matter)

puts "✅ 已生成新文章：#{filename}"
