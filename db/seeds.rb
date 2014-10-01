bob = User.create(email: "bob@dbc.com", password: "123")

article_1 = Article.create(title: "Hello World", content: "<p>This is an article on my blog! Yay articles!</p>")

smarm = Comment.create(content: "Hey I'm writing a jerky comment bc this is the internet lololol", user: bob, article: article_1)


article_2 = Article.create(title: "Ruby Loops Demystified", content:

'<p> <em>Note: This explanation of looping is geared towards absolutely-100%-new programmers. Consider yourself warned. Also, I highly recommend typing the examples into a new Ruby file and then running it to see the output and get a better feel for what is going on. Really - it helps!</em></p>

<p>Looping is a fundamental concept in computer programming. It is often necessary to repeat the same set of instructions multiple times, and rather than write those instructions over and over and over, you can use a loop to automate that repeating. </p>

<p>Often, you don\'t even know exactly how many times you will need to repeat something, so inside the loop you can include a way for the computer to figure it out for you. So instead of saying "Do this 5 times," you\'ll say "Do this x times." An added benefit here is that if you need to change the number of times those instructions are repeated, you\'ve built some flexibility into the code.</p>

<p>But I digress.</p>

<p>There are multiple ways to loop over code in Ruby, including both "language constructs" (built in syntax for expressing logic) like the reserved keywords <strong>while</strong>, <strong>until</strong>, and <strong>for</strong>; as well as "methods" (ways to do something to something) like <strong>.each()</strong> and <strong>.times()</strong>. </p>

<p>Perhaps the best way to explain these different kinds of loops is to first differentiate them by how they work.</p>

<h2>Conditional Loops</h2>

<p>Conditional loops execute the specified code <em>until a certain condition is met</em>. For example, you want to add candles to a birthday cake <em>until</em> you\'ve reached the age of the birthday child. (You can also execute the specified code <em>while a certain condition is still the case</em> - we\'ll see that in a second.)</p>

<p>Here you find yourself with a true or false situation: is the number of candles equal to the age yet? No? (False?) Okay, let\'s add another candle. Now is the number of candles equal to the age? (True or false?) And so on.</p>

<h3>Until Loops</h3>

<p>Ruby has a keyword that is perfect for this candle-adding situation, and not surprisingly, it is <strong>until</strong>. Ruby likes its mnemonic word choices, so that it almost seems like you\'re speaking English to the computer. (Other languages don\'t necessarily work this way.)</p>

<p>There are two ways to write this loop: as a conditional "statement" or as a conditional "modifier."</p>

<p><em>Statement syntax</em> for our birthday example would be:</p>

<blockquote>
<pre>candles = 0  <em>#because you haven\'t put any candles on the cake yet</em>
age = 5  <em>#have to specify the age or the computer won\'t know when to stop adding candles!</em>

until candles == age  <em>#here we specify the condition we want to meet: candles equals age</em>
   candles = candles + 1  <em>#here we add 1 to the number of candles, and this is the part 
   that gets repeated until the above condition (does the # of candles equal the age?) is met</em>
end  <em>#"end" tells the computer that the until loop stops here</em></pre>
</blockquote>

<p><em>Modifier syntax</em> would look like:<p>

<blockquote>
<pre>candles = 0
age = 5

candles += 1 until candles == age  <em>#add to candles until candles equals age</em>
</pre></blockquote>

<p><em>(Fyi: "+=" is a shorthand for "candles = candles + 1". Blew my mind first time I saw that.)</em></p>

<p>As you can see, assuming the code you\'re repeating isn\'t super complicated, the modifier version is much simpler and easier to read than the statement version.</p> 

<p>And because Ruby seems to always have at least three different ways to do the exact same thing, you can use another version of modifier syntax as well: </p>

<blockquote>
<pre>candles = 0
age = 5

begin
  candles += 1
end until candles == age  <em>#this seems a bit more confusing, in my opinion</em>
</pre></blockquote>

<h3>While Loops</h3>

<p>Related to the <strong>until</strong> loop is the <strong>while</strong> loop. It also uses a condition to decide how many times to do something. <strong>until</strong> does something <em>until</em> the condition is true (so it starts out "false"), but <strong>while</strong> is the opposite: </p>

<p><em>While</em> any of the candles are still lit, keep blowing.</p>

<p>In code, this looks like either (statement syntax):</p>

<blockquote>
<pre>lit_candles = 5

while lit_candles > 0
  lit_candles -= 1  <em>#keep blowing!</em>
end
</pre></blockquote>

<p>or (modifier syntax):</p>

<blockquote>
<pre>lit_candles = 5
lit_candles -= 1 while lit_candles > 0
</pre></blockquote>

<h3>Until vs While</h3>

<p>So what\'s the difference between these? Aren\'t they pretty much two different ways to accomplish the same thing? Couldn\'t I just say "until lit_candles is 0, keep blowing"?</p>

<p>Yes. Yes you could. In fact, a lot of other languages don\'t even have an <strong>until</strong> option, they only have <strong>while</strong>. The reason we have two options here is because Ruby was designed to read more like English than some of the older programming languages. </p>

<p>When you\'re choosing whether to use <strong>while</strong> or <strong>until</strong>, just ask yourself how you would state the situation in plain ol\' English. "I want to nap <em>until</em> 2:00."" "<em>While</em> I\'m at work I want to check my email hourly."" Whichever option makes it easier to read and understand, that\'s the option you should choose. </p>

<p>So that\'s conditional loops, but what about iterative loops?</p>

<h2>Iterative Loops</h2>

<p>Here, instead of having a true/false condition that we\'re working with, we simply want to do something a certain number of times. We want to <em>iterate</em> over a collection of data, repeating an action as many times as there are bits of info in our collection.</p>

<h3>For Loops</h3>

<p>To keep things simple, I\'ll use an array in the examples, which is pretty much just a list of things. For every "thing" in the list, we do something once. In fact, the syntax here uses <strong>for</strong>:</p>

<blockquote>
<pre>presents = [\'coloring book\', \'stuffed animal\', \'bouncy ball\', \'puzzle\']  <em>#here we\'re 
telling the computer what our array has listed inside: \'coloring book\', \'stuffed animal\', etc.</em>

for present in presents  <em>#see note below </em>
  puts present  <em>#put each item on the screen where we can see it</em>
end  <em>#again, saying "end" lets the computer know that\'s all of the code it needs to repeat</em>
</pre></blockquote>

<p>Note: Ruby doesn\'t know what a "present" is - this is just the name I chose to represent each and every item in the list as we go through that list. I could have chosen "a" or "x" or "hurricane" and it would still work - the names I chose just make more sense in this (birthday party) context than "hurricane" does. It\'s like in algebra, where "x" and "y" don\'t actually have any inherent value, they\'re more like placeholder names.</p> 

<p>Ruby also doesn\'t know what a "candle" is, or "age," or "lit_candles" - these are all just names that I\'ve used to help someone reading the code understand what I\'m talking about. Unfortunately, very new beginning coders can be confused by this because they haven\'t memorized all the words that Ruby <em>does</em> know. For this reason, it can be a good idea to have a list of keywords handy so you can double check when you\'re not sure! (If you didn\'t understand this until now, go re-read the code above and see if it makes more sense.)</p>

<h3>Looping Methods</h3>

<p>The <strong>for</strong> loop example given above is all well and good, works totally fine, but Ruby has some additional, special ways to loop over your data. The two most basic ones are <strong>each</strong> and <strong>times</strong>.</p>

<h4>Each Loops</h4>

<p><strong>each</strong> does very nearly the exact same thing as <strong>for</strong>, so unless you know you <em>need</em> to use <strong>for</strong>, you should try to use <strong>each</strong> instead (more about that in a bit):</p>

<blockquote>
<pre>presents = [\'coloring book\', \'stuffed animal\', \'bouncy ball\', \'puzzle\']

presents.each do |present|  <em>#for each item in presents do:</em>
  puts present  <em>#put the item on the screen</em>
end 
</pre></blockquote>

<p>We have to give some name to specify "individual thing in the list," and with the <strong>each</strong> method, our iterator variable "present" goes between two pipes: | | (as opposed to the <strong>for</strong> syntax which puts it between <strong>for</strong> and <strong>in</strong>).</p>

<h4>Each vs For</h4>

<p>So which version should you use? It is considered more <a href="http://learncodethehardway.org/blog/AUG_19_2012.html" target="new">idiomatic</a>
- "more Ruby" - to use <strong>each</strong> than to use <strong>for</strong>.</p> 

<p>The reason why, though, might be a little too much for an absolute beginner to wrap their head around: <strong>each</strong> creates an iterator variable (ie "present" in our presents example) that lives <em>only</em> within the "scope" (context) of the <strong>each</strong> "block" (the code between <strong>do</strong> and <strong>end</strong>).</p> 

<p>But, for now, you don\'t actually have to understand the why of it. Just remember if you use <strong>each</strong> you\'re less likely to accidentally get yourself in trouble: when using <strong>each</strong>, the iterator variable goes away once you\'re done with that bit of code, but <strong>for</strong>\'s iterator variable persists and so it could accidentally alter something you don\'t want to alter. Plus... it\'s what people expect you to do. Keep the peoples happy.</p>

<h4>Times Loops</h4>

<p>The <strong>times</strong> method is a similar approach to <strong>each</strong>, in that it\'s also more idiomatic:</p>

<blockquote>
<pre>3.times do  <em>#for a certain number of times, do the following:</em>
  puts "Happy birthday!"" 
end
</pre></blockquote>

<p>Again, one of the important ideas behind Ruby is that the code should be easy to understand. The above is certainly easier to read than, for example, our candle-inserting <strong>until</strong> loop (in this particular example\'s <strong>times</strong> loop, anyway - you could definitely make it more complicated if you need to do something more complicated!)
</p>

<h2>Loop de Loop</h2>

<p>And there we have our primary ways of repeating chunks of code in Ruby:</p>

<p><ul>
<li><strong>until</strong></li>
<li><strong>while</strong></li>
<li><strong>for</strong></li>
<li><strong>each</strong></li>
<li><strong>times</strong></li>
</ul></p>

<p>You will get lots of practice with these, because they really are used ALL THE TIME. Some additional resources in case you still have questions:</p>

<p><ul>
<li><a href="http://www.humblelittlerubybook.com/book/html/chapter3.html" target="new">http://www.humblelittlerubybook.com/book/html/chapter3.html</a></li>
<li><a href="http://www.tutorialspoint.com/ruby/ruby_loops.htm" target="new">http://www.tutorialspoint.com/ruby/ruby_loops.htm</a></li>
<li><a href="http://stackoverflow.com/questions/3294509/for-vs-each-in-ruby?rq=1" target="new">http://stackoverflow.com/questions/3294509/for-vs-each-in-ruby?rq=1</a></li>
<li><a href="http://stackoverflow.com/questions/5677081/ruby-difference-between-a-for-loop-and-an-each-loop" target="new">http://stackoverflow.com/questions/5677081/ruby-difference-between-a-for-loop-and-an-each-loop</a></li>
<li><a href="http://ruby.about.com/od/rubyfeatures/a/loops_2.htm" target="new">http://ruby.about.com/od/rubyfeatures/a/loops_2.htm</a></li>
<li><a href="http://davidraffauf.com/2013/01/30/writing-more-idiomatic-ruby-code/" target="new">http://davidraffauf.com/2013/01/30/writing-more-idiomatic-ruby-code/</a></li></ul></p>')
