ResizableTextView
=================

A UITextView subclass that resizes the text inside it based on minimum font size &amp; maximum font size.

Usage
=====

Just import the ResizableTextView.h & ResizableTextView.m files into your project directory and initialise the class like the following:

 ```ResizableTextView *resizableTextView = [[ResizableTextView alloc]initWithFrame:CGRectMake(0,22, 320, 200)];
    resizableTextView.minimumFontSizeInPoints=13;
    resizableTextView.maximumFontSizeInPoints=41;
    resizableTextView.backgroundColor=[UIColor grayColor];
    resizableTextView.font=[UIFont fontWithName:@"HelveticaNeue" size:resizableTextView.maximumFontSizeInPoints];```

Demo
====

![alt text](https://github.com/thegreatloser/ResizableTextView/blob/master/ResizableTextView.gif "Demo - ResizableTextView")

