package com.haui.shopthoitranghades.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_blogs")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BlogEntity extends BaseEntity {

    @Column(name = "avatar", length = 200, nullable = false)
    private String avatar;

    @Column(name = "title", nullable = false , length = 100)
    private String title;

    @Column(name = "content", nullable = false , length = 1000)
    private String content;

}
