require 'openai'

class Gpt3Service
  def initialize(client)
    @client = client
  end

  def content_recommendation(task)
    prompt = "You are an architectural expert, based on the following task description for an architectural project:\n#{task.content}\n\n
    Give me some recommendations to approach this task,
    Do not include numbers to separate each recommendation, instead, place an R: in front of each recommendation.
    Have roughly 3-4 bullet points at most.
    Thank you"


    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: prompt}], # Required.
        temperature: 0.7
        })

    return response.dig("choices", 0, "message", "content")
  end
end
