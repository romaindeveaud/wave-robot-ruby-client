#!/usr/bin/ruby
# Defines the generic robot classes.
#
# This module provides the Robot class and RobotListener interface,
# as well as some helper functions for web requests and responses.

require 'events'
require 'model'
require 'ops'
require 'rubygems'
require 'json'
require 'util'

class AbstractRobot
#  Robot metadata class.
#
#  This class holds on to basic robot information like the name and profile.
#  It also maintains the list of event handlers and cron jobs and
#  dispatches events to the appropriate handlers.

  @@name = ''
  @@image_url = ''
  @@profile_url = ''
  @@cron_jobs = {}

  def set_name(name)
    @@name = name
  end

  def set_image_url(url)
    @@image_url = url
  end

  def set_profile_url(url)
    @@profile_url = url
  end

  def add_cron_job(name, timer)
    @@cron_jobs[name] = timer
  end

  def handled_events
    RUBY_ROBOT_EVENTS.select { |e| self.respond_to?(e) }
  end

  def capabilities
    # Return this robot's capabilities as an XML string.
    lines = ['<w:capabilities>']
    handled_events.each { |e| lines.push "<w:capability name=\"#{e}\"/>" }
    lines.push '</w:capabilities>'

    robot_attrs = " name=\"#{@@name}\""
    robot_attrs += " imageurl=\"#{@@image_url}\"" unless @@image_url == ''
    robot_attrs += " profileurl=\"#{@@profile_url}\"" unless @@profile_url == ''

    lines.push("<w:profile#{robot_attrs}/>")
    return "<?xml version=\"1.0\"?>\n"+"<w:robot xmlns:w=\"http://wave.google.com/extensions/robots/1.0\">\n"+lines.join("\n")+"\n</w:robot>\n"
  end
end
