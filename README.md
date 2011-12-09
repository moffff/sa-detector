# Stand Alone Detector

This gem is created for simple addition of search by a certain parameter. Additionally sorting the records by the position of the search phrase in the parameter.

## Installation

Gemfile:

    gem 'sa_detector'

## How to use

Suppose there is a class named 'Document' with the parameter named 'title':

    create_table :documents do |t|
      t.string :title
      t.string :annotation
    end

### Search only

You need to add **searchable_by** inside class.

    # For search by one parameter

    class Document < ActiveRecord::Base
      searchable_by :title
    end

    # For search by multiple parameters

    class Document < ActiveRecord::Base
      searchable_by :title, :annotation
    end

And then you can search using the following command:

    Document.search_with params[:search_query]

### Search and sort by only one parameter

**TODO:** add support for multiple parameters

You need to add **searchable_and_sortable_by** inside class:

    class Document < ActiveRecord::Base
      searchable_and_sortable_by :title
    end

And then you can search and sort using the following command:

    Document.search_and_sort_with params[:search_query]

The result is an array of found records, sorted by the positions of search phrase in the parameter.

