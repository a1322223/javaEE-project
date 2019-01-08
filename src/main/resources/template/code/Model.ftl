package ${package}.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ${model} implements Serializable {
    private ${PK} id;
    <#list properties?keys as key>
    private ${properties[key]} ${key};
    </#list>
}