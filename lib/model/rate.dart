

    class Rate {
      late int id;
      late String raterType;
      late int raterId;
      late int serviceId;
      late int appointmentId;


      Rate();

      Rate.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        raterType = json['rater_type'];
        raterId = json['rater_id'];
        serviceId = json['service_id'];
        appointmentId = json['appointment_id'];
  
      }

      Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = {};
        data['id'] = id;
        data['rater_type'] = raterType;
        data['rater_id'] = raterId;
        data['service_id'] = serviceId;
        data['appointment_id'] = appointmentId;

        return data;
      }
    }
