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
  policy.img_src     :self, 'data:', 'https:', 'https://picsum.photos' # 允许外部图片
  policy.object_src  :none
  policy.script_src  :self, 
                     'unsafe-inline', # 仅作为临时解决方案
                     'https://js.stripe.com', 
                     'https://m.stripe.network', 
                     'https://esm.sh',
                     :unsafe_eval # 某些JS库可能需要
  policy.style_src   :self, 
                     'unsafe-inline', # 仅作为临时解决方案
                     'https://fonts.googleapis.com',
                     'https://fonts.gstatic.com'
  policy.frame_src   :self, 'https://js.stripe.com'
  policy.connect_src :self, 'ws:', 'wss:' # 允许WebSocket连接
  
  # 用于调试的报告URI
  policy.report_uri '/csp-violation-report' if Rails.env.development?
end

# 为内联脚本和样式启用nonce
Rails.application.config.content_security_policy_nonce_generator = ->(request) {
  SecureRandom.base64(16)
}
Rails.application.config.content_security_policy_nonce_directives = %w(script-src style-src)

# 仅在开发环境使用报告模式
Rails.application.config.content_security_policy_report_only = Rails.env.development?
