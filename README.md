# Thera

<h6>Problem</h6>
<p>Stigma attached to rape culture reinforces an environment that silences survivors from speaking about their experiences and hinders them from accessing the proper resources.
<h6>Solution</h6>
<p>Thera is an anonymous chat platform that connects certified, locally-sourced volunteers with survivors of sexual assault.

<h6>Core features</h6>
<ul>
<li>anonymous chat platform between survivors and volunteers
<li>volunteers can manage multiple conversations at once
<li>admin can add new volunteers, but volunteers cannot sign up themselves
</ul>

<h6>Application</h6>
<p>We used the Faye gem, a publish-subscribe messaging system, to manage chats in realtime. We used the Devise gem to manage roles: volunteers, admins, and anonymous users. Users seeking counsel immediately start a conversation with a volunteer without signing up or logging in.

<h6>Design</h6>
<p>Each volunteer can simultaneously manage several conversations with different users. Users have the ability to provide feedback on the service, which Thera will use to improve their service. Logging in is required only for volunteers, whose identity will be shown to users.

<h6>External Links</h6>
<p>Pivotal Tracker: https://www.pivotaltracker.com/n/projects/1545429</p>
<p>Heroku: https://theraapp.herokuapp.com
