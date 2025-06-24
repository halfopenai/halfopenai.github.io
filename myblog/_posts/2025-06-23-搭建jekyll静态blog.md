---
layout: post
title: "搭建Jekyll静态Blog"
date: 2025-06-23 17:04:24 +0800
categories: [Jekyll, Github, Pages, Action]
tags: [Tech]
image: /assets/img/20250623.png
math: false
toc: true
published: true
related: false
pin: false
description: >-
  在Github的pages, 使用Jekyll搭建静态Blog.
  使用chirpy主题美化网站
#last_modified_at: "2025-06-23 17:04:24 +0800"
---

# 概览
***Steps***
  1. 创建新的repo, 并命名为<your github name>.github.io
  2. 本地安装Jekyll环境(chruby, ruby-installer)
  3. 安装Jekyll、bundler包
  4. Clone主题Chripy到本地
  5. 将Chirpy主题文件夹命名为计划使用目录名, 比如myblog
  6. 修改_config.yml文件中配置, url和baseurl
  7. 修改Gemfile,指定包服务器、包及版本
  8. 通过bundle安装依赖,然后构建静态网站
  9. 本地启动服务, 验证应用启动正常
  10. 通过git将所有内容上传至github, 尝试能否正常访问<your github name>.github.io/myblog
  11. 创建Actions, 自动将main branch的内容同步到gh-pages branch

# 创建Repo
1. 登录Github, 点击Repositories标签页, 点击绿色New按钮
2. 创建新的repo, 并命名为<your github name>.github.io

# 安装本地Jekyll环境
MacOS安装
```zsh
brew install chruby ruby-install
```
安装ruby
```zsh
ruby-install ruby 3.4.1
```
安装Jekyll
```ruby
gem install jekyll bundler
```

>gem是ruby的包管理工具,类似python的pip
{: .prompt-info }

>通过命令可以创建默认主题的blog网站,我们这里采用chirpy主题
* jekyll new myblog
{: .prompt-tip }

拉取chirpy主题
```zsh
git clone https://github.com/cotes2020/chirpy-starter.git myblog
```
修改配置文件
```ruby
url: '<your github name>.github.io'
baseurl: ''
```
{: file='_config' }
修改Gemfile
```ruby
gem "jekyll-theme-chirpy", "~> 7.3"
gem "webrick", "~> 1.8"
```
{: file='Gemfile' }

## 安装依赖
```ruby
bundle install
bundle exec jekyll build
```

## 启动服务
```ruby
bundle exec jekyll s
```

## 访问网页
- [本地测试网页](http://127.0.0.1:4000)

## 上传项目文件
```zsh
git add .
git commit -m "Initial Blog site"
git push origin main
```

## 创建Github Actions,将blog主页指向新的branch

```zsh
name: Build and Deploy Jekyll Site

on:
  push:
    branches: [main]  # 每次推送 main 时触发

jobs:
  build:
    runs-on: ubuntu-latest

    defaults:
      run:
        working-directory: myblog

    steps:
      - name: Checkout source
        uses: actions/checkout@v4
        with:
          fetch-depth: 0  # 确保包含所有历史记录，用于部署

      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.4'
          bundler-cache: true

      - name: Install dependencies
        run: |
          bundle install

      - name: Build with Jekyll
        run: bundle exec jekyll build

      - name: Deploy to GitHub Pages (gh-pages branch)
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: myblog/_site
          publish_branch: gh-pages
          force_orphan: true  # 清空旧内容，保留纯净静态页
```
{: file=".github/workflows/jekyll.yml"}
>生成的提交密钥需要有wokflow的权限, 否则会失败
{: .prompt-tip }

## 再次提交
```zsh
git add .
git commit -m 'Add workflow'
git push origin main
```

## 修改pages分支信息
依次找到setting和pages, 将main分支改为gh-pages

## 后续
可以继续修改一些个人配置,联系信息,头像等.
