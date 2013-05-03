Description
===========

Accumulate resources and inject them into a file or template.

When working with Chef it is often desirable to use Chef resources to
implement a DSL t



After having implemented several DSLs of this type, a general pattern started
to become apparent. 

The pattern is to create a Chef::Resource type to implement a resource for the 
DSL definition and a provider that that searches for all the desired resources 
and then realizes them into the desired file.

Accumulator provides a generic Resource and Provider that allows you to
Accumulate all defined resources matching an arbitrary filter, potentially
transform the collection into an intermediary representation and finally 
inject the data into an existing file or template resource.

Usage
=====

A good examples of this pattern are sendmail-style aliases. In this
case we would like to have a lightweight chef resource that allows
us to programmatically define mail aliases from different cookbooks

see http://github.com/kisoku/chef-mail_alias
