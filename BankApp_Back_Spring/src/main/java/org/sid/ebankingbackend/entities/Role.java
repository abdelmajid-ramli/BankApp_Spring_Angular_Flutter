package org.sid.ebankingbackend.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.sid.ebankingbackend.enums.AccountStatus;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "roles")
@Data @NoArgsConstructor @AllArgsConstructor
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Enumerated(EnumType.STRING)
	@Column(length = 20)
	private ERole name;

}
