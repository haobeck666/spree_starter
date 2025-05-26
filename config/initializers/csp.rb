Rails.application.config.content_security_policy do |policy|
  # 1. 样式表规则：允许当前域名、内联样式、Google Fonts、esm.sh
  policy.style_src :self, 'unsafe-inline', 'https://fonts.googleapis.com', 'https://fonts.gstatic.com', 'https://esm.sh'
  
  # 2. 脚本规则：允许当前域名、Stripe 域名、内联脚本（临时使用 'unsafe-inline'）
  policy.script_src :self, 'unsafe-inline', 'https://js.stripe.com', 'https://m.stripe.network'
  
  # 3. 字体规则：延续之前的配置（允许 Base64、阿里云、Stripe 字体）
  policy.font_src :self, 'data:', 'https://at.alicdn.com', 'https://m.stripe.network', 'https://fonts.gstatic.com'
  
  # 4. 其他资源规则（如图片、连接）
  policy.img_src :self, :https, :data  # 允许图片来自当前域名、HTTPS 域名、Base64
  policy.connect_src :self, 'https://api.stripe.com'  # 允许连接到 Stripe API
  
  # 开发环境可放宽限制（可选）
  if Rails.env.development?
    policy.script_src :self, 'unsafe-inline', 'unsafe-eval'  # 允许开发环境的 eval
  end
end

# 生产环境关闭报告模式（严格执行）
Rails.application.config.content_security_policy_report_only = false
