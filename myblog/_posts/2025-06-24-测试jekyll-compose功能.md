---
layout: post
title: 测试Jekyll-compose功能
date: 2025-06-24 16:25 +0800
toc: false
---

## 在项目Gemfile文件中添加如下内容
{: data-toc-skip='' .mt-4 .mb-0}

```ruby
group :jekyll_plugins do
  gem 'jekyll-compose'
end
```
{: file='Gemfile'}

安装包
```ruby
bundle install
```
测试能否生成md文件
```ruby
bundle exec jekyll post 测试Jekyll Compose生成
```
>参考命令
- bundle exec jekyll post "标题"       #创建新文章
- bundle exec jekyll draft "标题"      #创建草稿
- bundle exec jekyll page "about"      #创建页面
- bundle exec jekyll publish "文件"    #将草稿发布成文章
{: .prompt-tip }

## 其他元数据介绍

* description: #简介,没有的话取前两段内容
* pin: 是否置顶
* published: 是否发布
* categories: 分类
* tags: 标签
