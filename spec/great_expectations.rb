require 'spec_helper'

module GreatExpectations
  def great_expectations
    return {
      :unordered_list => {
        :md => <<-EOMD,


* Item One
* Item Two
* Item Three

        EOMD
        :html => <<-EOHTML,
<ul>
<li>Item One</li>
<li>Item Two</li>
<li>Item Three</li>
</ul>

        EOHTML
      },
      
      :ordered_list => {
        :md => <<-EOMD,


1. Item One
12. Item Two
332353. Item Three


        EOMD
        :html => <<-EOHTML,

<ol>
<li>Item One</li>
<li>Item Two</li>
<li>Item Three</li>
</ol>

        EOHTML
      },
      
      :headings => {
        :md => <<-EOMD,

# Heading One

## Heading Two

## Second Heading Two

### Heading Three

#### Heading Four

##### Heading Five

###### Heading Six

## Third Heading Two

        EOMD
        :html => <<-EOHTML,

<h1>Heading One</h1>

<h2>Heading Two</h2>

<h2>Second Heading Two</h2>

<h3>Heading Three</h3>

<h4>Heading Four</h4>

<h5>Heading Five</h5>

<h6>Heading Six</h6>

<h2>Third Heading Two</h2>

        EOHTML
      }  ,

      :headings_and_paragraphs => {
        :md => <<-EOMD,

# Heading One

This is the introduction

## Heading Two

This talks about this section

### Heading Three

Here is info about this subsection.

And more info.

And more.

Then some.

And some more.

        EOMD
        :html => <<-EOHTML,

<h1>Heading One</h1>

<p>This is the introduction</p>

<h2>Heading Two</h2>

<p>This talks about this section</p>

<h3>Heading Three</h3>

<p>Here is info about this subsection.</p>

<p>And more info.</p>

<p>And more.</p>

<p>Then some.</p>

<p>And some more.</p>

        EOHTML
      }
      
    }
  end
end
