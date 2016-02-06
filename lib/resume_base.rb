require 'resume_base/version'
require 'yaml'
require 'active_support/all'
require 'active_model'

# <tt>ResumeBase</tt> is a library describing an individual and their work
# history and other relevant information for a potential employer.
module ResumeBase
  autoload :Resume,             'resume_base/resume'
  autoload :Hobby,              'resume_base/hobby'
  autoload :Skill,              'resume_base/skill'
  autoload :WorkHistoryEvent,   'resume_base/work_history_event'
  autoload :Reader,             'resume_base/reader'
  autoload :Person,             'resume_base/person'
end
