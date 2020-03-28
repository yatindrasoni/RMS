package com.dhavisoft.rms.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Program DTO class encapsulates Course attributes
 * 
 * @author soni
 * @version 1.0
 * @Copyright (c) Dhavisoft
 * 
 */
@Entity
@Table(name = "program")
public class ProgramDTO extends BaseDTO {

		/**
		 * Program Name
		 */
		@Column(name = "NAME", length = 50)
		private String name;

		/**
		 * Program Description
		 */
		@Column(name = "DESCRIPTION", length = 50)
		private String description;

		/**
		 * Program Duration
		 */
		@Column(name = "DURATION", length = 50)
		private String duration;

		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getDuration() {
			return duration;
		}

		public void setDuration(String duration) {
			this.duration = duration;
		}

		public String getKey() {
			return id + "";
		}

		public String getValue() {
			return name + "";
		}

		
}
