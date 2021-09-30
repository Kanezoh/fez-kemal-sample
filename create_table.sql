drop table if exists articles;
create table articles (
id int AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
content MEDIUMTEXT NOT NULL,
content_summary VARCHAR(255) NOT NULL,
img_url VARCHAR(255),
created_at DATETIME default current_timestamp NOT NULL,
updated_at timestamp default current_timestamp on update current_timestamp NOT NULL,
PRIMARY KEY(id)
);

drop table if exists article_categories;
create table article_categories (
id int AUTO_INCREMENT,
article_id int NOT NULL,
category_id int NOT NULL,
PRIMARY KEY(id)
);

drop table if exists categories;
create table categories (
id int AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

# テストデータ
insert into articles (title, content_summary, content, img_url) VALUES ('最初のブログのタイトルです', '最初のブログです。', 
'
<h3 id="tables">Tables</h3>
<table>
<thead>
<tr>
<th>Left columns</th>
<th align="center">Right columns</th>
</tr>
</thead>
<tbody><tr>
<td>left foo</td>
<td align="center">right foo</td>
</tr>
<tr>
<td>left bar</td>
<td align="center">right bar</td>
</tr>
<tr>
<td>left baz</td>
<td align="center">right baz</td>
</tr>
</tbody></table>
<h2 id="blocks-of-code">Blocks of code</h2>
<pre><code>let message = &#39;Hello world&#39;;
alert(message);
</code></pre>
<h2 id="inline-code">Inline code</h2>
<p>This web site is using <code>markedjs/marked</code>.</p>'
, 'https://cover.openbd.jp/9784480081568.jpg
');
