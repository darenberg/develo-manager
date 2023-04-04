require 'openai'

class Gpt3Service
  def initialize(client)
    @client = client
  end

  def content_recommendation(tasks)
    tasks_text = tasks.map(&:content).join("\n")

    prompt = "Based on the following tasks for and architectural project:\n#{tasks_text}\n\nProvide content recommendations for a new task:"

    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: prompt}], # Required.
        temperature: 0.7
        })

    raise
    return response.dig("choices", 0, "message", "content")
  end
end
