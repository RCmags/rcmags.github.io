---
layout: post
title: "Adding Latex to Jekyll for pretty equations"
katex: true
---

In the process of setting up my blog, I recently encountered the challenge of rendering equations, specifically expressions from the [LaTeX](https://www.latex-project.org/) markup language, which is designed for writing mathematical notation. By default, [Jekyll](https://jekyllrb.com/) does not convert these expressions into visually appealing equations. However, we can work around this limitation by using additional tools to render them. One solution is to use a website that converts LaTeX code into an image, which can then be embedded into our site. This is precisely what I did for the review post of my [sensor fusion algorithm for an IMU](/projects/arduino-libraries/2020/03/14/imu_sensor_fusion.html). While this approach works well for infrequent use of LaTeX, it makes sense to implement a rendering add-on for more regular use.

**See: [latex2png](https://www.latex2png.com/)**

{% include image.html src="/img/imu-filter/equations1/equation1.png" %}
<p align="center"><i>An image created from LaTeX code</i></p>

After a few internet searches, I found a blog post detailing how to embed a JavaScript library called [KaTeX](https://github.com/KaTeX/KaTeX). This library allows you to take LaTeX code written in a Markdown file and render it as beautiful equations. According to the blog post, all that was needed was to add a few lines to include some JavaScript files and a CSS file in the **<head>** element of the **default.html** page used by Jekyll. Here's the required code:

**See: [Adding LaTeX to your Jekyll Site](https://ionathan.ch/2021/05/19/latex-in-jekyll.html)** by Jonathan Chan.

{% highlight javascript %}
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@latest/dist/katex.min.css"/>

<!-- JavaScript -->
<script defer src="https://cdn.jsdelivr.net/npm/katex@latest/dist/katex.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/katex@latest/dist/contrib/auto-render.min.js"
  onload="renderMathInElement(document.body,{
    delimiters: [
      { left: '$$',  right: '$$',  display: true  },
      { left: '$',   right: '$',   display: false },
      { left: '\\[', right: '\\]', display: true  },
      { left: '\\(', right: '\\)', display: false }
  ]});">
</script>
{% endhighlight %}

<br>
**Note:** Jekyll can highlight code syntax through the `pygments` plugin by wrapping code snippets between the `{ % highlight <language> % } { % endhighlight % }` tags. See: [Add syntax highlighting to gh-pages](https://stackoverflow.com/questions/6615415/add-syntax-highlighting-to-gh-pages).

This process was straightforward, and much to my surprise, it worked flawlessly. My only concern with this approach is the reliance on external JavaScript files. If I wanted to work on the website offline or found myself without an internet connection, I wouldn't be able to render the LaTeX. To mitigate this issue, I decided to save the KaTeX files locally on the Jekyll server. Initially, I attempted to copy the files from the internet into any directory within the Jekyll project, but this didn’t work correctly—the LaTeX did not render as expected. After another search, I discovered a Stack Overflow post stating that KaTeX requires a specific directory structure to function properly. According to the termianal output of the Jekyll server, I was also missing the _fonts_ folder, so I had to download the KaTex repository and copy the folder into my page's directory. 

**See: [Loading KaTeX locally](https://stackoverflow.com/questions/60905163/why-katex-is-not-loaded-locally)**. The required directory structure is as follows:

```
/katex/katex.min.css
/katex/katex.min.js
/katex/contrib/auto-render.min.js
/katex/fonts
```

<br>
Once I placed _all_ the KaTeX files in this specific structure, the LaTeX began to render correctly. According to the code, you can use different tags to adjust the CSS style of the equations. When the display is set to **false**, the equation will be centered on the page. Here’s an example using the `\\[ \\]` tags:

`\\[ I_e = \int_{0}^t{(K_{p}e(t) - K_{c}{I_e})dt} \\]`

And here’s the same example using the `\\( \\)` tags: `\\( I_e = \int_{0}^t{(K_{p}e(t) - K_{c}{I_e})dt} \\)`

You can also create more complex equations by simply modifying the underlying LaTeX code. Check out the **[LaTeX Cheatsheet](https://quickref.me/latex)** for an overview of different LaTeX expressions:

```
\\[ f\relax(x) = \int_{-\infty}^\infty
    f\hat\xi\,e^{2 \pi i \xi x}
    \,d\xi 
\\]
```
With just a few changes to the `<head>` tag of my Jekyll site, I was able to render elegant equations quickly. This solution is both simple and effective, and I want to commend the developers who made this system possible. Well done!
