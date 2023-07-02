

    class Rate {
      int? id;
      String? raterType;
      int? raterId;
      int? serviceId;
      int? appointmentId;
      String? createdAt;
      String? updatedAt;

      Rate(
          {this.id,
            this.raterType,
            this.raterId,
            this.serviceId,
            this.appointmentId,
            this.createdAt,
            this.updatedAt});

      Rate.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        raterType = json['rater_type'];
        raterId = json['rater_id'];
        serviceId = json['service_id'];
        appointmentId = json['appointment_id'];
        createdAt = json['created_at'];
        updatedAt = json['updated_at'];
      }

      Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['rater_type'] = this.raterType;
        data['rater_id'] = this.raterId;
        data['service_id'] = this.serviceId;
        data['appointment_id'] = this.appointmentId;
        data['created_at'] = this.createdAt;
        data['updated_at'] = this.updatedAt;
        return data;
      }
    }
