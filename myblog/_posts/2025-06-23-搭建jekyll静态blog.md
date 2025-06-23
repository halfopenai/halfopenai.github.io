---
layout: post
title: "搭建Jekyll静态Blog"
date: 2025-06-23 17:04:24 +0800
categories: [Jekyll, Github, Pages, Action]
tags: [Tech]
author: halfopenai
image: /assets/img/20250623.png
math: false
toc: true
published: false
related: false
pin: false
description: >-
  在Github的pages, 使用Jekyll搭建静态Blog.
  使用chripy主题美化网站
#last_modified_at: "2025-06-23 17:04:24 +0800"
---

# 概览
***Steps***
  1. 创建新的repo, 并命名为<your github name>.github.io
  2. 本地安装Jekyll环境(chruby, ruby-installer)
  3. 安装Jekyll、bundler包
  4. Clone主题Chripy到本地
  5. 将Chripy主题文件夹命名为计划使用目录名, 比如myblog
  6. 修改_config.yml文件中配置, url和baseurl
  7. 修改Gemfile,指定包服务器、包及版本
  8. 通过bundle安装依赖,然后构建静态网站
  9. 本地启动服务, 验证应用启动正常
  10. 通过git将所有内容上传至github, 尝试能否正常访问<your github name>.github.io/myblog
  11. 创建Actions, 自动将main branch的内容同步到gh-pages branch

# 创建Repo
