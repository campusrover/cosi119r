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
  first_day: "aug-29-2024",
  weekdays: [:tuesday, :thursday],
  start_times: ["15:55", "15:55"],
  end_times: ["17:15", "17:15"],
  number: 26,
  skips: ["oct-03-2024", "oct-24-2024", "nov-28-2024","dec-10-2024"],
  start_time: "15:55",
  end_time: "17:15"
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
HOME_PAGE = "/content/intro/10_syllabus.cg"

# Menulinks defines the links on the navigation bar.
# They are formatted as "Name" - "URL" pair.
#
# Examples:
#   %w[HOME /content/index.md]
#   %w[TOC /content/course_toc.md]
MENULINKS = [
             ["LAB NOTEBOOK", "https://campusrover.github.io/labnotebook2/"],
            %w[MOODLE https://moodle.brandeis.edu/course/view.php?id=1374]
]

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

# SLIDES
SLIDES_CONFIG = {
  # Ignore_selectors ignore certain html elements from rendering in the slides.
  ignore_selectors: ['li ul', 'li p:not(:first-child)'],

  # Reveal.js specific options
  # See: https://revealjs.com/config/
  
  revealjs_opts: {
    transition: 'none',
    progress: true
  }
}.freeze
