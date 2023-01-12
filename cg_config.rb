# frozen_string_literal: true

# Coursegen configuration file.
#
# Note that in order to read the configuration file, this file must be at the
# root of the course directory.
require 'coursegen'

# AUTHOR
AUTHOR_NAME = 'R. Pito Salas'
AUTHOR_EMAIL = 'rpsalas@brandeis.edu'
COPYRIGHT_STRING = "Copyright (2013-#{Time.now.year}) #{AUTHOR_NAME}, #{AUTHOR_EMAIL}".freeze

# Bucket Deployment of the course
AWS_BUCKET = "cosi119r"

# COURSE
COURSE_SHORT_NAME = 'Cosi119a'
COURSE_LONG_NAME = 'Autonomous Robotics'
COURSE_ABBREV = 'AR'

# Lectures_schedule defines the schedule of lectures.
#
# This is primarily used to 1) figure out the time and date of each class,
# and 2) figure out the ordering of classes on the sidebar.

LECTURES_SCHEDULE_CONFIG = ScheduleDef.new(
  first_day: "jan-18-2023",
  weekdays: [:monday, :wednesday],
  start_times: ["16:05", "16:05"],
  end_times: ["17:25", "17:25"],
  number: 26,
  skips: ["feb-20-2023", "feb-22-2023", "apr-05-2023", "apr-10-2023", "apr-12-2023", "apr-17-2023"],
  start_time: "16:05",
  end_time: "17:25"
)

# Section_config defines the structure of the course.
#
# Each section is defined by
#   title     name of the section
#   selector  directory of the section (under /content)
#   type      type of the section (:section or :lecture)
#   schedule  schedule of the lecture (only needed for :lecture)
#
# Additionally, you can choose to hide the section on the sidebar by setting
# hidden: true.
SECTION_CONFIG = [
  SectionDef.new("Welcome", "intro", type: :section, collapsed: false, bullet: :star),
  SectionDef.new("Lectures", "lectures",
                 type: :lecture, schedule: LECTURES_SCHEDULE_CONFIG, bullet: :dash),
  SectionDef.new("Homework", "homework", hidden: true, type: :section),
  SectionDef.new("Course Resources", "background", hidden: false, type: :section),
  SectionDef.new("extras", "extras", hidden: true, type: :section),
  SectionDef.new("topics", "topics", hidden: true, type: :section)
].freeze

# SITE
#
# The URL of the deployed site.
# Please include any http or https prefix.
SITE_URL = "http://cosi119r.s3-website-us-west-2.amazonaws.com"

# Home_page sets the home page of the site.
# This is usually /content/index.md.erb.
#
# Note: the .erb suffix is required when setting the HOME_PAGE path.
HOME_PAGE = "/content/intro/10_syllabus.md.erb"

# Menulinks defines the links on the navigation bar.
# They are formatted as "Name" - "URL" pair.
#
# Examples:
#   %w[HOME /content/index.md]
#   %w[TOC /content/course_toc.md]
MENULINKS = [%w[lectures /content/intro/20_coursetoc.md/],
             %w[homeworks /content/intro/22_homeworks.md/],
             ["lab notebook", "https://campus-rover.gitbook.io/lab-notebook/"]]

# Helpful_box provides a feedback box on the sidebar.
#
# DO NOT USE. This is currently not functional.
HELPFUL_BOX = false

# STYLING
#
# Options:
#   bullet_style: css style for each bullet
STYLING_CONFIG = {
  bullet_style: '"font-size: 60%; width: 10px; color: grey"'
}.freeze

# SEARCH
#
# Coursegen uses DocSearch by Algolia (https://docsearch.algolia.com/) to
# provide site-wide full-text search functionality.
#
# In order for search to function, you need to replace with your own
# search API key, and name of your index from Algolia.
# For details, please refer to https://github.com/pitosalas/coursegen/blob/master/README.md.
SEARCH_CONFIG = {
  api_key: '7a8497e7-0c93-4450-9562-5e2ed40958ec',
  index_name: 'cosi119r',
  # APP_ID is only used if you are running DocSearch on your own.
  app_id: '',
  debug: false
}.freeze

# SLIDES
SLIDES_CONFIG = {
  # Ignore_selectors ignore certain html elements from rendering in the slides.
  ignore_selectors: ['li ul', 'li p:not(:first-child)'],

  # Reveal.js specific options
  # See: https://revealjs.com/config/
  revealjs_opts: {
    transition: 'slide'
  }
}.freeze
