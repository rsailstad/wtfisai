# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create sections
sections = [
  {
    title: "Introduction to AI",
    description: "Learn the basics of artificial intelligence, its history, and fundamental concepts.",
    order: 1,
    premium: false,
    slug: "introduction-to-ai"
  },
  {
    title: "Key Terminology",
    description: "Understand the essential terms and concepts in AI and machine learning.",
    order: 2,
    premium: false,
    slug: "key-terminology"
  },
  {
    title: "AI in Everyday Life",
    description: "Discover how AI is already part of your daily routine and how to make the most of it.",
    order: 3,
    premium: true,
    slug: "ai-in-everyday-life"
  },
  {
    title: "AI for Business",
    description: "Learn how to leverage AI to grow your business and improve operations.",
    order: 4,
    premium: true,
    slug: "ai-for-business"
  },
  {
    title: "Future of AI",
    description: "Explore emerging trends and what the future might hold for artificial intelligence.",
    order: 5,
    premium: true,
    slug: "future-of-ai"
  }
]

sections.each do |section_data|
  section = Section.create!(section_data)
  
  # Create content for each section
  case section.title
  when "Introduction to AI"
    contents = [
      {
        title: "What is Artificial Intelligence?",
        body: "Artificial Intelligence (AI) refers to the simulation of human intelligence in machines that are programmed to think like humans and mimic their actions. The term may also be applied to any machine that exhibits traits associated with a human mind such as learning and problem-solving.",
        content_type: "article",
        order: 1,
        premium: false,
        slug: "what-is-artificial-intelligence"
      },
      {
        title: "History of AI",
        body: "The concept of artificial intelligence dates back to ancient times, but the field as we know it began in the 1950s. This article explores the key milestones in AI development, from the early days of symbolic AI to the current era of deep learning.",
        content_type: "article",
        order: 2,
        premium: false,
        slug: "history-of-ai"
      }
    ]
  when "Key Terminology"
    contents = [
      {
        title: "Machine Learning Basics",
        body: "Machine learning is a subset of AI that focuses on building systems that can learn from and make decisions based on data. Learn about supervised learning, unsupervised learning, and reinforcement learning.",
        content_type: "article",
        order: 1,
        premium: false,
        slug: "machine-learning-basics"
      },
      {
        title: "Neural Networks Explained",
        body: "Neural networks are computing systems inspired by the biological neural networks that constitute animal brains. This article explains how they work and why they're so powerful.",
        content_type: "article",
        order: 2,
        premium: true,
        slug: "neural-networks-explained"
      }
    ]
  when "AI in Everyday Life"
    contents = [
      {
        title: "Smart Assistants and You",
        body: "Learn how to make the most of AI-powered assistants like Siri, Alexa, and Google Assistant to improve your daily life.",
        content_type: "article",
        order: 1,
        premium: true,
        slug: "smart-assistants-and-you"
      },
      {
        title: "AI in Healthcare Apps",
        body: "Discover how AI is transforming healthcare through apps that can monitor your health, provide medical advice, and even detect potential health issues.",
        content_type: "article",
        order: 2,
        premium: true,
        slug: "ai-in-healthcare-apps"
      }
    ]
  when "AI for Business"
    contents = [
      {
        title: "AI for Customer Service",
        body: "Learn how AI can help improve your customer service through chatbots, automated responses, and intelligent routing systems.",
        content_type: "article",
        order: 1,
        premium: true,
        slug: "ai-for-customer-service"
      },
      {
        title: "Data Analysis with AI",
        body: "Discover how AI can help you analyze business data to make better decisions and identify new opportunities.",
        content_type: "article",
        order: 2,
        premium: true,
        slug: "data-analysis-with-ai"
      }
    ]
  when "Future of AI"
    contents = [
      {
        title: "Emerging AI Trends",
        body: "Explore the latest trends in AI, from quantum computing to edge AI and beyond.",
        content_type: "article",
        order: 1,
        premium: true,
        slug: "emerging-ai-trends"
      },
      {
        title: "Ethics in AI",
        body: "Understand the ethical considerations surrounding AI development and deployment, and how to ensure responsible AI use.",
        content_type: "article",
        order: 2,
        premium: true,
        slug: "ethics-in-ai"
      }
    ]
  end

  contents.each do |content_data|
    section.contents.create!(content_data)
  end
end

# Create an admin user
User.create!(
  name: "Admin User",
  email: "admin@wtfisai.org",
  password: "password123",
  password_confirmation: "password123"
)
