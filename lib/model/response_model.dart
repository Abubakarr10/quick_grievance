class ResponseModel {
  ResponseModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.usageBreakdown,
    required this.systemFingerprint,
    required this.xGroq,
  });
  late final String id;
  late final String object;
  late final int created;
  late final String model;
  late final List<Choices> choices;
  late final Usage usage;
  late final UsageBreakdown usageBreakdown;
  late final String systemFingerprint;
  late final XGroq xGroq;

  ResponseModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    choices = List.from(json['choices']).map((e)=>Choices.fromJson(e)).toList();
    usage = Usage.fromJson(json['usage']);
    usageBreakdown = UsageBreakdown.fromJson(json['usage_breakdown']);
    systemFingerprint = json['system_fingerprint'];
    xGroq = XGroq.fromJson(json['x_groq']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    data['choices'] = choices.map((e)=>e.toJson()).toList();
    data['usage'] = usage.toJson();
    data['usage_breakdown'] = usageBreakdown.toJson();
    data['system_fingerprint'] = systemFingerprint;
    data['x_groq'] = xGroq.toJson();
    return data;
  }
}

class Choices {
  Choices({
    required this.index,
    required this.message,
    this.logprobs,
    required this.finishReason,
  });
  late final int index;
  late final Message message;
  late final Null logprobs;
  late final String finishReason;

  Choices.fromJson(Map<String, dynamic> json){
    index = json['index'];
    message = Message.fromJson(json['message']);
    logprobs = null;
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['message'] = message.toJson();
    data['logprobs'] = logprobs;
    data['finish_reason'] = finishReason;
    return data;
  }
}

class Message {
  Message({
    required this.role,
    required this.content,
  });
  late final String role;
  late final String content;

  Message.fromJson(Map<String, dynamic> json){
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }
}

class Usage {
  Usage({
    required this.queueTime,
    required this.promptTokens,
    required this.promptTime,
    required this.completionTokens,
    required this.completionTime,
    required this.totalTokens,
    required this.totalTime,
  });
  late final double queueTime;
  late final int promptTokens;
  late final double promptTime;
  late final int completionTokens;
  late final double completionTime;
  late final int totalTokens;
  late final double totalTime;

  Usage.fromJson(Map<String, dynamic> json){
    queueTime = json['queue_time'];
    promptTokens = json['prompt_tokens'];
    promptTime = json['prompt_time'];
    completionTokens = json['completion_tokens'];
    completionTime = json['completion_time'];
    totalTokens = json['total_tokens'];
    totalTime = json['total_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['queue_time'] = queueTime;
    data['prompt_tokens'] = promptTokens;
    data['prompt_time'] = promptTime;
    data['completion_tokens'] = completionTokens;
    data['completion_time'] = completionTime;
    data['total_tokens'] = totalTokens;
    data['total_time'] = totalTime;
    return data;
  }
}

class UsageBreakdown {
  UsageBreakdown({
    this.models,
  });
  late final Null models;

  UsageBreakdown.fromJson(Map<String, dynamic> json){
    models = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['models'] = models;
    return data;
  }
}

class XGroq {
  XGroq({
    required this.id,
  });
  late final String id;

  XGroq.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}