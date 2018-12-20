package server.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Pedido {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "pedido_id")
	private Integer id;
	private String nome;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy=MM-dd")
	private Date dateNascimento;
	private String endereço;
	private String cidade;
	private String estado;
	private String cep;
	private MetodoPagamento metodoPagamento;
	private StatusPedido status;
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "produto_pedido", joinColumns = @JoinColumn(name = "pedido_id"), inverseJoinColumns = @JoinColumn(name = "produto_id"))
	private List<Produto>produtos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDateNascimento() {
		return dateNascimento;
	}

	public void setDateNascimento(Date dateNascimento) {
		this.dateNascimento = dateNascimento;
	}

	public String getEndereço() {
		return endereço;
	}

	public void setEndereço(String endereço) {
		this.endereço = endereço;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public MetodoPagamento getMetodoPagamento() {
		return metodoPagamento;
	}

	public void setMetodoPagamento(MetodoPagamento metodoPagamento) {
		this.metodoPagamento = metodoPagamento;
	}

	public StatusPedido getStatus() {
		return status;
	}

	public void setStatus(StatusPedido status) {
		this.status = status;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	@Override
	public String toString() {
		return "Pedido [id=" + id + ", nome=" + nome + ", dateNascimento=" + dateNascimento + ", endereço=" + endereço
				+ ", cidade=" + cidade + ", estado=" + estado + ", cep=" + cep + ", metodoPagamento=" + metodoPagamento
				+ ", status=" + status + ", produtos=" + produtos + "]";
	}
	
	
	
	
}
