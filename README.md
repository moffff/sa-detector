Stand Alone Detector
====================

This gem is created for simple addition of search by a certain parameter. Additionally sorting the records by the position of the search phrase in the parameter.

Installation
------------

Gemfile:

    gem 'sa_detector'

How to use
----------

Suppose there is a class named 'Document' with the parameter named 'title':

    create_table :documents do |t|
      t.string :title
      t.timestamps
    end

You need to add 'searchable_by' inside class:

    class Document < ActiveRecord::Base
      searchable_by :title
    end

And then you can search using the following command:

    Document.search_and_sort_by params[:search_query]

The result is an array of found records, sorted by the positions of search phrase in the parameter.

