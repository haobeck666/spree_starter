# config/initializers/csp.rb
Rails.application.config.content_security_policy do |policy|
  # 允许字体来源：当前域名、Base64 编码、阿里云字体、Stripe 字体
  policy.font_src :self, 'data:', 'https://at.alicdn.com', 'https://m.stripe.network'
  
  # 允许 Stripe 脚本和 iframe
  policy.script_src :self, 'https://js.stripe.com', 'https://m.stripe.network'
  policy.frame_src :self, 'https://js.stripe.com'
  
  # 其他资源类型的默认配置（根据需要调整）
  policy.default_src :self
  policy.img_src :self, :https, :data
  policy.style_src :self, :unsafe_inline  # 若有内联样式需要启用
  policy.connect_src :self, 'https://api.stripe.com'
  
  # 开发环境额外配置
  if Rails.env.development?
    policy.script_src :self, :https, :unsafe_eval  # 允许开发环境的 eval
    policy.connect_src :self, 'ws://localhost:3035'  # 允许 WebSocket 连接
  end
end

# 报告模式（可选）：只记录违规但不阻止加载
Rails.application.config.content_security_policy_report_only = false
