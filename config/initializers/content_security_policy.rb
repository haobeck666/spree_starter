# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

# Rails.application.configure do
#   config.content_security_policy do |policy|
#     policy.default_src :self, :https
#     policy.font_src    :self, :https, :data
#     policy.img_src     :self, :https, :data
#     policy.object_src  :none
#     policy.script_src  :self, :https
#     policy.style_src   :self, :https
#     # Specify URI for violation reports
#     # policy.report_uri "/csp-violation-report-endpoint"
#   end
#
#   # Generate session nonces for permitted importmap, inline scripts, and inline styles.
#   config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }
#   config.content_security_policy_nonce_directives = %w(script-src style-src)
#
#   # Report violations without enforcing the policy.
#   # config.content_security_policy_report_only = true
# end
Rails.application.config.content_security_policy do |policy|
  policy.default_src :self
  policy.font_src    :self, 'https://fonts.googleapis.com', 'https://fonts.gstatic.com'
  policy.img_src     :self, 'data:', 'https:'
  policy.script_src  :self, 'unsafe-inline', 'https://js.stripe.com', 'https://m.stripe.network', 'https://esm.sh' # 添加 unsafe-inline 和必要域名
  policy.style_src   :self, 'unsafe-inline', 'https://fonts.googleapis.com' # 添加 unsafe-inline
  policy.frame_src   :self, 'https://js.stripe.com' # 若涉及 Stripe 表单嵌入
end
